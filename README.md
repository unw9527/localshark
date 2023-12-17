# localshark

This repo helps build a Docker container to locally test labs in CMU 15513/15213 Introduction to Computer Systems (a.k.a CSAPP), Summer 2023 version. The container is built based on ubuntu 22.04 and has all necessary dependencies and packages installed.

## Why localshark?

**TL;DR**:
* Say goodbye to the unstable and delayed connection to remote shark machines
* No login needed
* No periodical shutdown

Full answer:

Though CMU provides several remote shark machines for development and testing, the connection to these remote machines is extremely unstable and the delay is often intolerable, especially when you are not physically in the US. (Can you bear with typing something in the terminal and the characters do not show up until a few SECONDS have passed?) 

Also, disconnection from these remote machines often happens when you have been inactive for a while, resulting in frequent re-logins. These remote machines also go down for several hours periodically for maintainence or update. Since shark machines do not allow users to use public rsa to bypass password check, you need to type in your tedious password every time you login, which is apparently troublesome.

localshark is basically a workaround for this: it lets you develop and test your labs on your own machine, without the hassle of sshing to any remote shark machines.

## How to use?
Simply run `./start-container.sh` and enjoy your development.

<img src='https://github.com/unw9527/localshark/blob/main/images/interface.png' width='50%'>

## Pre-requisite
You need to have docker installed on your machine (and of course start docker before you run the script).

## Testing
The Summer 2023 version has 1+7 labs, and the labs that are explicitly supported are:
* cordlab
* datalab
* cachelab
* malloclab
* shelllab
* proxylab

**Example test results**:

<img src='https://github.com/unw9527/localshark/blob/main/images/cordlab-grade.png' width='40%'>

<img src='https://github.com/unw9527/localshark/blob/main/images/datalab-grade.png' width='40%'>

bomblab and attacklab are **not** supported for two reasons:
1. These two labs require no coding at all. I do not see any point of setting up a local dev env for labs without coding.
2. Submission of these two labs must be made via shark machines for the sake of grading. So you need to connect to shark machines when doing these two labs anyway.
