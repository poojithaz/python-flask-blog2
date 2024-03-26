from flask import Flask , render_template, request, session , redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from flask_mail import Mail
from datetime import  datetime
import  json
import os
import math

with open('config.json' , 'r') as c :
    params = json.load(c) ["params"]
local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(

   MAIL_SERVER = 'smtp.gmail.com',
   MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD =  params['gmail-password']
)
mail = Mail(app)

if(local_server):
    app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']


db = SQLAlchemy(app)

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    phone_num = db.Column(db.String(12),  nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12),  nullable=True)
    email = db.Column(db.String(12), nullable=False)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), unique=False, nullable=False)
    tag_line = db.Column(db.String(80), unique=False, nullable=False)
    slug = db.Column(db.String(21),  nullable=False)
    content = db.Column(db.String(120),  nullable=True)
    date = db.Column(db.String(12), nullable=False)


@app.route("/")
def home():
    posts = Posts.query.all()
    last = math.ceil(len(posts) / int(params['no_of_posts']))
    page = request.args.get('page')

    if not page or not page.isnumeric():
        page = 1
    else:
        page = int(page)

    posts = posts[(page - 1) * int(params['no_of_posts']): page * int(params['no_of_posts'])]

    prev = None
    next = None

    if page == 1:
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif page == last:
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)
@app.route('/about')
def about():
    return render_template('about.html',params = params)

@app.route('/dashboard', methods = ['GET','POST'])
def dashboard():

    if ('user' in session and session['user'] == params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html',params=params,posts = posts)


    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        if (username == params['admin_user'] and password == params['admin_password']):
            session['user'] = username
            posts = Posts.query.all()
            return render_template('dashboard.html',params=params,posts = posts)
        else:
            return render_template('login.html', params=params)
    else:
        return render_template('login.html', params=params)

@app.route('/edit/<string:sno>',methods = ['GET','POST'])
def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == "POST":
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            date = datetime.now()

            if sno == '0':
                post = Posts(title=box_title,slug=slug,content=content,tag_line=tline,date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title =  box_title
                post.slug = slug
                post.content = content
                post.tag_line = tline
                post.date = date
                db.session.commit()
                return redirect ('/edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html',params=params,post = post)


@app.route('/uploader',methods = ['GET','POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method == 'POST'):
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            return "Uploaded successfully"


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route('/delete/<string:sno>',methods = ['GET','POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route('/contact',methods = ['GET','POST'])
def contact():
    if(request.method == 'POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name,phone_num = phone,date = datetime.now(), msg = message,email = email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('new message from Blog' + name,
                          sender=email,
                          recipients = [params['gmail-user']],
                          body = message + "\n" + phone
                          )
    return render_template('contact.html',params = params)

@app.route('/post/<string:post_slug>',methods=['GET'])
def post_route(post_slug):
    # Get the post with the given slug from the database
    post = Posts.query.filter_by(slug=post_slug).first()
    # Render a template to show the post
    return render_template('post.html',params = params, post = post)
app.run(debug=True)




