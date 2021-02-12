#!/usr/bin/python

import cgi, cgitb 
form = cgi.FieldStorage() 

name = form.getvalue('name')
street  = form.getvalue('street')
city = form.getvalue('city')
postal = form.getvalue('postal')
phone = form.getvalue('phone')

name = name.lower()
name = name.title()
street = street.lower()
street = street.title()
city = city.lower()
city = city.title()
temp = city.split(" ")
a = len(temp) - 1
if len(temp[a]) == 2:
    temp[a] = temp[a].upper()

city = " ".join(temp)
postal = postal.upper()
ph = phone.split("-")

html = """Content-type:text/html\r\n\r\n
<html>
    <head>
        <title>Lab 6 - Part 2 (Python)</title>
        <style>
            body {
                background-color: seashell;
                padding-left: 30px;
            }

            #title {
                font-family: 'Lilita One', cursive;
                font-size: 3em;
                color: #CC313D;
                text-shadow: -5px 3px black;
                padding-top: 0.1em;
            }

            h1, h2 {
                font-family: 'Bree Serif', serif;
                display: inline;
                color: grey;
            }

            h1 {
                position: relative;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="lab6.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Lilita+One&display=swap" rel="stylesheet">
    </head>
    <body>
        <div id="title">
            <p>CONTACT INFORMATION</p>
        </div>
        <div>
            <h2>Name: %s</h2>
        </div>
        <br>
        <div>
            <h2>
                Address: <br>
                %s <br>
                %s <br>
                %s <br>
            </h2>
        </div>
        <br>
        <div>
            <h2>Phone: </h2>
            <h1 style="color:cornflowerblue;" id="ph1">
                (%s)
            </h1>
            <h1 style="color:lightcoral;" id="ph2">
                %s-
            </h1>
            <h1 style="color:lightseagreen;" id="ph3">
                %s
            </h1>
        </div>
    </body>
</html>""" % (name, street, city, postal, ph[0], ph[1], ph[2])

print html
