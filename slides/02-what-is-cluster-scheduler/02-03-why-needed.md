# Why is it needed?

<p class="fragment fade-in">
OH NOES! I need to scale up quickly.
</p>
<p class="fragment fade-in">
OH NOES! I need to utilize my machines better.
</p>
<p class="fragment fade-in">
OH NOES! My machine died.
</p>

Note:

So, then again, what are the problems we are trying to solve with this?

Well, hopefully the service you are making will be successful, and then what happens? You need to scale. Too bad you have to make a change in your configuration management tool to make it happen, which has a much to long roundtrip. It gets even worse when you need to dynamically scale up and down as the load on different services varies throughout the day.

At the same time you would like to use the least amount of hardware to support this scaling. Good luck doing that with your configuration management tool!

And then the worst scenario: one of your machines dies. What happens with the applications that was running on that machine? Well, I know for sure that I would not like to be the one responsible for fixing this!
