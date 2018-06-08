# Overview
There were a ton of different configurations available online, but everyone that I tried to utilize, came back with a "too many parameters"
error, and I could not find any documentation as to what wecutil was complaining about or any log files to help trouble shoot the issue.

There are a few fields you can change if you do not like the default settings. After you have executed the command below, you will
need to go add the groups you want to forwarding logs to your subscription into the GUI. It's possible to do it in the XML file, but I
had a few issues going with that approach as well.

I was finally able to get this to execute from utilizing the command below after find this persons blog: 
https://blogs.technet.microsoft.com/supportingwindows/2016/07/18/setting-up-a-source-initiated-subscription-on-an-event-collector-computer/

## Usage
To load this xml file simply execute the following:
```
wecutil cs WEC.xml
```

The above configuration has been tested on multiple 2016 servers, so if you have any issues please let me know.
