Unit 8: Group Milestone
===



# Tinder-Habit Tracking App

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description
Imagine a merge of Tinder and Habit tracking app. You will be able to help yourself and others stay accountable with matching accountability buddies from all over the world. 

### App Evaluation
- **Category:** Social & Productivity
- **Mobile:** In a complete version, this app can access your location and suggest forming accountability group near you. You can also call your accountability buddy on the platform to co-work/ co-achieving your goals. Push notification to remind users of habit they're building.
- **Story:** Let users set their goals and show them on their profiles. Users go through the matching process much like Tinder (swiping right if they think the other can be a good match). If both swipe right, they can schedule weekly meeting with a check-in template to track and encourage each other's progress. 
- **Market:** Focus on young audience who are struggling to form new habits during isolation. This audience is likely goal-oriented, sociable folks.
- **Habit:** Frequent checking-in with another users (positive social connection and pressure); dashboard that shows progress; push notification.
- **Scope:** First we want to build the basic goal-setting and matching functions as the MVP. Other functions such as video call, psychological nudge will be built if we have time.

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User logs in using Google account
    * Connect with their Google calendar to best schedule meetings with partners
    * Automatically using their Google profile picture as the app's profile picture
* First-time user:
    * Choose their goal from a drop-down list
* Users can change habits they want to form
* Users can see other users profile and go through the matching process like Tinder
* In the dashboard screen, user can see the habits they are trying to form (cap at 3 habits for more realistic engagement), their current partners 
* User can schedule new meetings with partners via the connected Google account. 
    * The scheduled event has a checklist of questions to go through. The meeting should take no longer than 30 minutes


**Optional Nice-to-have Stories**

* More complicated matching process: After initial matching (both swipe right), proceed to chat box to discuss more. Only after this discussion and both agree to be actual accountability partners do they appear on each other's dashboard as "buddies"
* Besides drop-down list for habits, have users type in their habit and mark it "Other"
* Profile pages for each user
* Settings (Accesibility, Notification, General, etc.)
* Cap on how many buddies they can match with. Again, to make the commitment with the app realistic and not overwhelming.
* Users can set notifications to remind them to do the tasks (eg: Push notification at 8:00 PM every day for workout)
* Notifications that celebrate milestones 
* Built-in video call/ voice call function so users don't need other apps such as Google Meet for frequent check-in

### 2. Screen Archetypes

* Login and Register: Connect with Google account
* First-time user: Drop-down list of habits to choose from
* Dashboard
    * Scheduled next meeting button
    * List of habits
    * List of partners
* Schedule Meeting:
    * Date
    * Time
    * Timezone
    * Partner
    * Description: default as a template of check-in questions we'll create
* Find a partner 
    * show profiles of other users that want to break/ form that habit
        * if there’s no other user (you’re the first): a static page: “No user for now. Come back later”
        * else: show people who shares similar habits -> let swipe
	    * if have people but run out of people -> loop through existing profiles to make sure the user choose at least one buddy




### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Dashboard
* Find a partner

Optional:
* Setting

**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account registration if no log in is available
* Log-in 
	* First-time user: Drop-down list of habits to choose from -> Dashboard
	* else -> Dashboard
* Dashboard -> Pressed "Schedule New Meeting" Button -> Schedule Meeting Screen


## Digital Wireframes & Mockups
[Imgur](https://imgur.com/0NzCxOF)


### Further questions to research:
* Does each habit can only match with one partner? Or can allow multiple habits with one partner?
* Best practices with accountability buddy? 
* Best practices in forming habits?
* Habit forming constraints?
