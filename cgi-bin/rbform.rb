#!/usr/bin/ruby

require 'cgi'
cgi = CGI.new('html4')
name = cgi['name']
street = cgi['street']
city = cgi['city']
postal = cgi['postal']
phone = cgi['phone']

name = name.split.map(&:capitalize).join(' ')
street = street.split.map(&:capitalize).join(' ')
city = city.split(' ')

$i = 0
$max = city.length - 1

while $i <= $max do
    if $i == $max
        if city[$i].length == 2
            city[$i] = city[$i].upcase
        else
            city[$i] = city[$i].capitalize
        end
    else
        city[$i] = city[$i].capitalize
    end
    $i += 1
end

city = city.join(' ')
postal = postal.upcase
phone = phone.split('-')

cgi.out {
    cgi.html {
        cgi.head {"\n" +
            cgi.title {"Ruby Form Submission"} + 
            cgi.style('type'=>'text/css'){File.read("rbpyform.css")} +
            "<link href=\"https://fonts.googleapis.com/css2?family=Bree+Serifs&family=Lilita+One&display=swap\" rel=\"stylesheet\">"
        } +
        cgi.body { "\n"+
            cgi.div { "\n"+
                cgi.p('id' => 'title') {
                    "CONTACT INFORMATION" 
                }
            } +
            cgi.div { "\n"+
                cgi.h2('id' => 'contact') {
                    "Name: " + name
                }
            } +
            cgi.div { "\n"+
                cgi.h2('id' => 'contact') {
                    "Address: " + "<br>" +
                    street + "<br>" +
                    city + "<br>" +
                    postal 
                }
            } +
            cgi.div { "\n"+
                cgi.h2('id' => 'phone') {
                    "Phone: "
                } +
                cgi.h1('class' => 'ph1') {
                    "(" + phone[0] + ") "
                } +
                cgi.h1('class' => 'ph2') {
                    phone[1] + "-" 
                } +
                cgi.h1('class' => 'ph3') {
                    phone[2]
                }
            } 
        }
    }
}
