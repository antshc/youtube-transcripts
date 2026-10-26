# Audio Transcription

**File:** audio.mp3
**Language:** EN
**Engine:** faster-whisper
**Date:** 2026-10-26 16:45:59

---

## Full Transcription

**[00:00 → 00:05]**  
So Addy is Maddy. He's probably one of the most respected engineers at Google for well over a decade

**[00:05 → 00:12]**  
And he's recently just after a tropic the maker of cloud code and he's just gone and open sourced all his agent skills

**[00:12 → 00:17]**  
So 100,000 stairs later. It's probably one of the most popular AI repos on GitHub right now

**[00:17 → 00:21]**  
So if you've been following the channel at all, you'll know I've already broken down

**[00:21 → 00:25]**  
Pstack from Lauren Tan a cursor and then also Matt Pogox skills

**[00:25 → 00:29]**  
So Addy is the third of the big three now that we've got all three

**[00:29 → 00:32]**  
You can see that they're solving different problems by the end of this video

**[00:32 → 00:39]**  
You'll know what Addy is doing when to reach for each pack and why I think you don't need to run all of these across all of your projects

**[00:39 → 00:41]**  
They can be a bit of overkill sometimes. I'm Rob

**[00:41 → 00:45]**  
This is switch dimension and let's start with how Addy thinks about his skillset

**[00:45 → 00:50]**  
So quick context if you don't know who Addy is he's a bit of a legend in the JavaScript world

**[00:50 → 00:55]**  
He wrote learning JavaScript design patterns. He led the Chrome developer experience and web performance work at Google

**[00:55 → 00:59]**  
If you've ever run lighthouse or read about core web vitals

**[00:59 → 01:02]**  
You've probably been affected by his work at some stage

**[01:02 → 01:05]**  
So I think that's really relevant because when somebody like Addy writes down

**[01:05 → 01:09]**  
This is how you want an agent to engineer software. You want to pay attention

**[01:09 → 01:15]**  
What you're really getting is a seasoned engineer's brain compressed into markdown

**[01:15 → 01:19]**  
And that's what I love about skills before we read tons of our early books on best practices

**[01:19 → 01:23]**  
Now we're basically studying and examining skills from the top performers

**[01:23 → 01:26]**  
So here's the big idea. Addy's approach is a lifecycle

**[01:26 → 01:34]**  
Six stages define plan build verify review ship and each stage has a slash command to go with it

**[01:34 → 01:39]**  
If you've been watching my videos for the last two years or you've done any kind of spec driven development

**[01:39 → 01:43]**  
Would be mad or superpowers this will feel very familiar and that's kind of the point

**[01:43 → 01:47]**  
Matt skills have their own vocabulary grilling and wayfinder and fog of war

**[01:47 → 01:50]**  
P-stack has potato mode and arenas

**[01:50 → 01:53]**  
Addy's is the most traditional to the software development lifecycle

**[01:53 → 01:59]**  
You don't have to learn a metaphor. It's the software development lifecycle done properly with an agent

**[01:59 → 02:04]**  
So I think of all the stacks this can fit in very well with an existing development team or in the enterprise

**[02:04 → 02:11]**  
So spec writes a proper PRD covering objectives, structure, code style, testing and boundaries

**[02:11 → 02:13]**  
Before a line of code

**[02:13 → 02:21]**  
Plan breaks that into small atomic tasks with acceptance criteria and build implements one thin vertical slice of the time

**[02:21 → 02:25]**  
You implemented you test it you verify you commit it then you test review and ship

**[02:25 → 02:28]**  
So there's one mode that I really like. It's called slash build auto

**[02:28 → 02:32]**  
So you approve the plan once and then it runs every task autonomously after that

**[02:32 → 02:36]**  
It removes you kind of having to step in between tasks

**[02:36 → 02:39]**  
But it doesn't remove the verification, which is important for you to look at

**[02:39 → 02:43]**  
So every task is still test driven and it's committed on its own

**[02:43 → 02:45]**  
And then it stops if something fails

**[02:45 → 02:48]**  
So I think that's kind of like the right way to do autonomy

**[02:48 → 02:55]**  
So slash constraints basically is another style of interview just to test out what your quality level or quality bar is

**[02:55 → 02:57]**  
And then it writes this to a constraints.md file

**[02:57 → 03:01]**  
Then there is a slash web perf for web performance

**[03:01 → 03:07]**  
It does a performance audit which you know given who wrote this addy spani the the king of web performance

**[03:07 → 03:12]**  
You'd hope this is going to be good and then slash code simplify is for when the code works

**[03:12 → 03:16]**  
But nobody really wants to touch it and you want to simplify or break it down

**[03:16 → 03:22]**  
There's a lot of overlap between what Lauren talks about and also what Matt Polcock talks about in terms of similar skills

**[03:22 → 03:26]**  
So there's 25 skills in total plus four reviewer personas

**[03:26 → 03:31]**  
There's a staff engineer test engineer a security auditor and a web performance auditor

**[03:31 → 03:34]**  
Okay, so let's look inside the skills as always on this channel

**[03:34 → 03:42]**  
The slash commands aren't the interesting part the skill files are here's where we really get inside a software engineers brain

**[03:42 → 03:46]**  
So every skill has what addy would call a anti rationalization table

**[03:46 → 03:53]**  
It's a list of the excuses an agent will make to skip past a step. We see agents doing this all the time

**[03:53 → 03:56]**  
And then you've got the rebuttal to why it would skip right next to it

**[03:56 → 04:02]**  
So it'll test for things and reasoning traces like this is too simple to test or I tested it manually

**[04:02 → 04:08]**  
So if you've worked with agents or you've worked with juniors of hair doll these excuses before and writing the excuses down in advance

**[04:08 → 04:11]**  
Is really a smart move here's a quick tip and working with multiple agents

**[04:11 → 04:15]**  
Thanks to our friends over at neon when you're developing new code with agents

**[04:15 → 04:21]**  
You're going to want to have multiple different feature branches just to be sure that you don't impact the main production branch

**[04:21 → 04:23]**  
Unfortunately, it gets a bit more complicated than that

**[04:23 → 04:28]**  
We have the main branch, but we also need a database branch and maybe even some storage

**[04:28 → 04:33]**  
Otherwise what you get is a preview branch. Maybe it's got a copy of postgres and that's okay

**[04:33 → 04:39]**  
But then it might end up uploading the file to the wrong storage and we end up with a production break

**[04:39 → 04:44]**  
I've been using neon for years for my database needs just because of their superior branching and a whole lot of other reasons

**[04:44 → 04:51]**  
But what you might not have noticed is now there are full platform database storage functions auth and AI gateway

**[04:51 → 04:56]**  
Why is that a beautiful thing you might ask so your agent using the CLI can now create a branch of everything

**[04:56 → 05:03]**  
It needs to be safe. That includes your database your functions your blockage your auth user anything that you need

**[05:03 → 05:05]**  
Each agent gets its own copy instantly

**[05:05 → 05:09]**  
Rob Shock's viewers can sign up to neon for free via the link in the description down below

**[05:09 → 05:14]**  
So this one is really interesting. It's called doubt driven development

**[05:14 → 05:17]**  
We've heard of domain driven development. This is doubt driven development

**[05:17 → 05:20]**  
So for any non trivial decision or important decision

**[05:20 → 05:25]**  
It spins up a fresh context review and the one job is to doubt the claim

**[05:25 → 05:29]**  
So claim, extract, doubt, reconcile, stop

**[05:29 → 05:34]**  
It's basically adversary review during the build not just at the end

**[05:34 → 05:39]**  
As you start to read through the rest of the skills you start spotting some old friends and paradigms

**[05:39 → 05:45]**  
Hiram's law in the API design skill so every observable behavior of your API will eventually be

**[05:45 → 05:49]**  
Depended on by somebody and then the Beyonce rule in the testing skill

**[05:49 → 05:51]**  
If you liked it, you should put a test on it

**[05:51 → 05:53]**  
I'm not going to sing this

**[05:53 → 05:58]**  
And Chesterton's fence in code simplification don't delete the fence until you know why it's there

**[05:58 → 06:01]**  
trunk-based development small atomic commits

**[06:01 → 06:03]**  
Code as a liability

**[06:03 → 06:09]**  
So that's basically Adi Esmani's software engineering brain turned into agent instructions

**[06:09 → 06:14]**  
Honestly, if you never install this just reading through the skills is a better software engineering course than most

**[06:14 → 06:17]**  
So how does this compare to the other two?

**[06:17 → 06:22]**  
So my polcock skills basically are asking do we agree on what we're building

**[06:22 → 06:28]**  
So do you and the agent agree you're setting up the domain his most popular skill would be krill me

**[06:28 → 06:31]**  
And that's basically where the agent interrogates you before it writes anything

**[06:31 → 06:37]**  
Then there's the idea of a shared language glossary which would be Adi or which are decision records

**[06:37 → 06:39]**  
And then you've got specs and tickets

**[06:39 → 06:44]**  
Matt still falls in with the traditional SDLC. It's just he is approaching it in a different way

**[06:45 → 06:50]**  
A lot of his skills put the effort up front before you actually begin to code

**[06:50 → 06:57]**  
And he's openly said he's anti framework. He thinks things like be mad spec it superpowers take away your control

**[06:57 → 07:03]**  
So his skills are deliberately small they're composable and you can use them where you need to and hack them yourself

**[07:04 → 07:09]**  
My interpretation of Lauren Tan's peace stock is really about can you prove it works?

**[07:09 → 07:15]**  
Lauren deliberately has no planning skills her line is the best spec is the code all the weight really is on the

**[07:15 → 07:22]**  
Investigation the verification and multimodal review after the fact the build past doesn't count as evidence

**[07:22 → 07:27]**  
We need to prove that out Adi skills then are more around did we follow the whole process

**[07:27 → 07:35]**  
He's the only one of the three that really covers the full SDLC life cycle right through to continuous integration and deployment

**[07:35 → 07:36]**  
observability

**[07:37 → 07:45]**  
Deprecation and shipping it's probably the most team friendly and the most portable since it installs into something like 70 different agents

**[07:45 → 07:51]**  
What I've ended up with personally is a mix of all of these together and I don't use them all at the same time

**[07:51 → 07:53]**  
I use different skills at different points

**[07:53 → 07:56]**  
I've got light medium and heavy versions of my skill runtime

**[07:56 → 08:02]**  
So reach for polcock when the problem is fuzzy when you're not sure what you want or you're working on a cold base

**[08:02 → 08:05]**  
You live with for years and you really care about the design

**[08:05 → 08:10]**  
Grill me is still the single best skill. I'd install first to do that

**[08:10 → 08:15]**  
I'd reach for Adi when you're on a team shipping to production and you want a predictable process

**[08:15 → 08:21]**  
Everyone recognize or when you want all the quality gates without designing them yourself

**[08:21 → 08:28]**  
My own skill set falls more in this kind of a process because I'm working with teams of developers and teaching them how to apply agents

**[08:28 → 08:32]**  
Then I'd reach for p-stack when it gets really narrowly. It's a bug you can't reproduce

**[08:32 → 08:39]**  
You're looking to apply swarms and arenas against a problem. There's a migration. You've got long-running agents

**[08:39 → 08:43]**  
Maybe it's an overnight run and you need to trust them when you wake up

**[08:43 → 08:49]**  
And of course if you're running cursor and you've got several models because her skills work really well as a plug-in with cursor

**[08:49 → 08:53]**  
And you'll also notice that there's huge overlap and they borrow from each other constantly

**[08:53 → 08:55]**  
It's not that they're actually borrowing from each other

**[08:55 → 09:00]**  
It's just that software engineers converge on how to build software all together at the same time

**[09:00 → 09:05]**  
So there is going to be a lot of overlap and again software engineering is opinionated

**[09:05 → 09:08]**  
You just pick the best opinion and apply it to your own workflow

**[09:08 → 09:11]**  
There are basically just three angles here all on the same craft

**[09:11 → 09:17]**  
So my actual opinion on all of this we don't need all of these skills on every single project

**[09:17 → 09:21]**  
That is a massive overkill agents are getting super smart now

**[09:21 → 09:26]**  
And one of the best things you can do is actually run through your agents.md file or your existing skills

**[09:26 → 09:32]**  
And actually start to pair them back and prune them because you'll be surprised at how powerful the models are

**[09:32 → 09:37]**  
I'm thinking that skills now are more about this is how I like to work as opposed to

**[09:37 → 09:43]**  
necessarily teaching the agent anything new in fact having really long skill files and an excess of skills

**[09:43 → 09:46]**  
Is just going to bloat and confuse your context window

**[09:46 → 09:54]**  
So if you're just changing a button color you don't need a PRD a task breakdown a five-axis arena review from p stack

**[09:54 → 09:59]**  
Or a security auditor you just need to change the button and look at it

**[09:59 → 10:04]**  
So the way I think about it is effort level ceremony should match the stakes of what you're working on

**[10:04 → 10:06]**  
So a small tweak just do it and then check it yourself

**[10:06 → 10:12]**  
If it's very visual or prototype based just do it yourself check it quickly refresh and move on

**[10:12 → 10:15]**  
You're iterating with the agent if it's a small feature a quick

**[10:15 → 10:20]**  
Grill me or discovery session so that you're aligned and then some test driven development

**[10:20 → 10:27]**  
If it's a big or fuzzy feature you're trying to figure out then a spec and a plan broken down into phases

**[10:27 → 10:30]**  
And then you verify each one in between if it's production

**[10:30 → 10:33]**  
There's security involved or anything irreversible

**[10:33 → 10:34]**  
That's when you bring out the full review

**[10:34 → 10:38]**  
doubt driven development and then all the security hardening that comes with it

**[10:38 → 10:46]**  
So even Adi says this about his own skills his adoption guide to them is a gradual verification first rollout on an existing

**[10:46 → 10:47]**  
Cold-based don't install

**[10:47 → 10:53]**  
25 skills and try to run everything that's complete overload and there is a practical cost here too

**[10:53 → 10:59]**  
Every skill you install is something the agent has to consider and then you might end up auto-triggering these skills by accident

**[10:59 → 11:03]**  
When you don't want them more skills doesn't necessarily mean a smarter agent

**[11:03 → 11:09]**  
So I guess the real lesson here is and I've kind of been saying this for a while learning these skills is really

**[11:09 → 11:14]**  
Learning good software development practice test driven development small vertical slices

**[11:15 → 11:19]**  
Agreeing on requirements before you build writing down why you made a decision

**[11:19 → 11:22]**  
You're not deleting defense until you know why it's there

**[11:22 → 11:25]**  
Don't go deleting anything until you know specifically why it's there

**[11:25 → 11:29]**  
And then proving it works against the real thing if you just see green light test

**[11:29 → 11:33]**  
That doesn't mean your app works you need to actually test properly and none of this is new

**[11:33 → 11:35]**  
It's not like any of these guys invented this

**[11:35 → 11:39]**  
Matt Polcock credits the pragmatic programmer and domain driven design

**[11:39 → 11:42]**  
Andy is basically Google's engineering book

**[11:42 → 11:48]**  
Lauren has years of react and meta experience the scaler just those ideas in a format that an agent can follow

**[11:48 → 11:51]**  
So don't treat any of these packs as a religion

**[11:52 → 11:56]**  
As kind of like in a Riley textbook you can install them read them

**[11:56 → 12:00]**  
You steal what works and then build your own skills on top of them

**[12:00 → 12:03]**  
And that's basically encoding how you work

**[12:03 → 12:06]**  
You're sharing the best of that with your team and they share back

**[12:06 → 12:08]**  
It's your stack and it's your own quality bar

**[12:08 → 12:12]**  
This is basically your own team or your own personal harness

**[12:12 → 12:15]**  
And that's going to be bespoke to you and help you move a whole lot faster

**[12:15 → 12:18]**  
And every time your agent screws something up don't be a child

**[12:18 → 12:21]**  
Don't swear it is just go and update your skill based on new learnings

**[12:21 → 12:24]**  
That's exactly how all of these three packs were built

**[12:24 → 12:28]**  
So if you want to go deeper on building your own skills library and agent workflows

**[12:28 → 12:31]**  
That's exactly what we do with switch dimension the course and community

**[12:31 → 12:34]**  
The link is in the description below and you can get on the wait list

**[12:34 → 12:37]**  
So I'd love to know in the comments which skill packs are you running right now

**[12:37 → 12:41]**  
Have you written skill sets of your own feel feel free to share them in the comments

**[12:41 → 12:45]**  
I love to know what people are actually building and using in production

**[12:45 → 12:48]**  
If this is useful subscribe because this is a series

**[12:48 → 12:52]**  
If you missed them the peace tack breakdown and Matt Polcock video around the screen right now

**[12:52 → 12:53]**  
You should watch those next
