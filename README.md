# todoist-roam

In combination with https://github.com/WilliamDurin/gcal-roam, I use this plugin to drive my agenda creation for the day. This script uses todoist cli to grab todoist entries that are due today but do not have a reminder time set. It then exports them in todo format in Roam and completes the tasks in Todoist. I don't touch tasks with a time because I want to keep them in Todoist so they can remind me at the specified times.

**This is very rough and not meant to be plug and play. It is completely unsupported. I just wanted to put it out there to be a base start for others.**

## Background

Once I'm in Roam, it makes a lot of sense to add todo items in the process of note taking because of what you gain from having tasks in with the context of what created the task.

However, there are some things that Roam isn't great at.

For example, I continue to use Todoist for:

* Quick capture of tasks using Mobile, Voice, etc. The mobile quick capture in Roam is not quick at all. Todoist excels at. Todoist has integrations into everything, including voice.

* Remind me to do something at a specific time or place.

* Aggregate tasks from other people/systems. For instance, I use Spark's Todoist integration to make todo items for emails that are going to take me some time to respond to and then archive it to keep at inbox zero. I also use Pleexy to hook up my work JIRA to my Todoist account to create tasks for things I have to do at work.

## Requirements

* macOS
* Alfred
* Homebrew

## Setup

```
git clone https://github.com/WilliamDurin/todoist-roam.git
brew tap sachaos/todoist
brew install todoist
todoist (Enter API key from https://todoist.com/prefs/integrations)
```

There's also an Alfred workflow to hook this up, but you'll need to edit the location of the script to be where your app.
