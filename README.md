# Chat Terminal

A terminal based chat application for super fast communication. Based on MQTT protocol.

## Solving the topic name problem - For 1-1 communication

### Option 1 (Simplest)
The topic name is always enforced to be in the format /sender/receiver. The sender/receiver refers to a unique ID of a user, which could be their username or phone number. Every client must authenticate to the application. A client can only publish/subscribe to a topic that has their ID in it. As soon as a client registers to the app, they are automatically subscribed to /\*/clientID topic name. And only this topic name. Enforced by **Access Control List(ACL)**. The broker therefore uses **Topic Discovery** on this rule to ensure all the relevant messages are automatically sent to the intended person, without having to explicitly subscribe every time. The server name/ID must be removed/abstracted from the end user. If not, someone could manually create a client and authenicate to the server, and subscribe to a randome user1/user2 topic to sniff their messages. This approach doesn't scale for group messages. What to do then?
