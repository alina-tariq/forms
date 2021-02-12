#!/usr/bin/perl
use CGI ':standard';
print "Content-type: text/html\n\n";

$name = param('name');
$year = param('birth-year');
$clr = param('colour');

$age = 2020-$year;
if ($clr eq "red") {
    $newline = "Good for you, that's her favourite colour, too."
} else {
    $newline = "Too bad for you, her favourite colour is red."
}

print qq(
    <html lang="en">
        <head>
            <title>Lab 4 - Part 2</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, intital-scale=1">
            <link rel="stylesheet" href="perlresultstyle.css">
            <link href="https://fonts.googleapis.com/css2?family=Eater&display=swap" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Montez&display=swap" rel="stylesheet">
        </head>
        <body id="bg">
            <h1 id="welc" style="color:$clr;">
                WELCOME TO THE WITCH's LAIR, $name!
            </h1>
            <h2 id="intro" style="color:$clr;">
                She hears you like the colour $clr. $newline
            </h2>);
if (($clr eq "red") && ($age >= 18)) {
    print qq(
            <h2 id="intro" style="color:$clr;">
                She won't eat you now.
            </h2>  
            <h2 id="intro" style="color:$clr;"> 
                At $age, you're a little old for her tastes anyway. Hurray!
            </h2>   
        </body>
    </html>);
} elsif (($clr eq "red") && ($age < 18)) {
   print qq(
            <h2 id="intro" style="color:$clr;">
                She won't eat you now.
            </h2> 
            <h2 id="intro" style="color:$clr;">
                Being $age, you should be very grateful. Woohoo!
            </h2>   
        </body>
    </html>);
} elsif (($clr ne "red") && ($age >= 18)) {
   print qq(
            <h2 id="intro" style="color:$clr;">
                She should eat you for that.
            </h2>  
            <h2 id="intro" style="color:$clr;">
                Being $age, though, you're too old for her tastes. Boohoo!
            </h2>   
        </body>
    </html>);
} elsif (($clr ne "red") && ($age < 18)) {
   print qq(
            <h2 id="intro" style="color:$clr;">
                She will eat you for that. 
            </h2>  
            <h2 id="intro" style="color:$clr;">
                Especially since you're $age. Yum!
            </h2>   
        </body>
    </html>);
}
