> 更新于 2013-5-27

# Timeline & Statuses
## 获取当前登录用户及其所关注用户的最新文章(实现)
url: users/:id/friends_timeline.json  
verb: GET  
arguments:   

    :id 为当前本用户的id  

result:  

    [
        {
            "id": 1,
            "content": "分享文章！",
            "favorited": false,
            "topics": [
                ...
            ],
            "reposts_count": 8,
            "comments_count": 9,
            "good_count": 5,
            "bad_count": 1,
            "created_at": "Tue May 31 17:46:55 +0800 2011",
            "user": {
                ...
            },
            "retweeted_status": {
                ...
            },
        },
        ...
    ]


## 重置当前登录用户的时间线刷新时间(实现)
url: users/:id/reset.json  
verb: GET  
arguments:   

    :id 为当前本用户的id  

result:  同users/:id.json   

## 获取当前登录用户及其所关注话题的最新文章
url: statuses/topics_timeline.json  
verb: GET  
arguments:  
result:  同statuses/friends_timeline.json  

## 获取某个用户最新发表的文章列表(实现)
url: users/:id/timeline.json  
verb: GET 
arguments: 

    uid: int: 要查看的用户的用户ID  

result:  同users/:id/friends_timeline.json  

## 获取某个话题最新的文章列表
url: statuses/topic_timeline.json  
verb: GET 
arguments: 
> tid: int: 要查看的话题的ID  

result:  同statuses/friends_timeline.json  

## 根据ID显示指定文章(实现)
url: statuses/:id.json  
verb: GET
arguments:  

    :id  文章ID  
result:  

    {
        "id": 11488058246,
        "content": "分享文章！",
        "favorited": false,
        "topics": [
            ...
        ],
        "reposts_count": 8,
        "comments_count": 9,
        "good_count": 5,
        "bad_count": 1,
        "created_at": "Tue May 31 17:46:55 +0800 2011",
        "user": {
            ...
        },
        "retweeted_status": {
            ...
        }
    }


result:  同statuses/show.json  

## 发布/转发一篇文章(实现)
url: statuses.json   
verb: POST  
arguments:  
 
    {
        "status": {
            "content": "内容",
            "retweeted_id": 1, //或为null
            "topics": [ "Ruby", "less", "java"] //或为null
        } 
    }

result:  同statuses/:id.json

## 根据ID删除指定文章(实现)
url: statuses/:id.json  
verb: DELETE  
arguments:

    :id  要删除文章的ID  

result:  同statuses/:id.json  

# Comments
## 根据文章ID返回其评论列表(实现)  
url: statuses/:id/comments.json  
verb: GET  
arguments:

    :id  文章的ID  

result: 

    [
        {
            "created_at": "Wed Jun 01 00:50:25 +0800 2011",
            "id": 12438492184,
            "content": "love your work.......",
            "user": {
                   ...
            },
            "status": {
                ....
            },
            "reply_comment": {
                ...
            } //end of "reply_comment"
        },
        ...
    ]  

## 获取当前登录用户所接收到的评论列表  
url: comments/comments.json  
verb: GET  
arguments:  
result:  同comments/show.json  

## 获取当前登录用户所发出的评论列表(实现)   
url: users/:id/comments.json   
verb: GET  
arguments:  

    :id  当前登陆用户的id

result:  同comments/show.json  

## 发出/回复一条评论(实现)  
url: comments.json    
verb: POST  
argument:  

    {
        "comment": {
            "content": "内容",
            "status_id": 1,
            "reply_comment_id": "11" //可以没有
        }
    }

result: 

    {
        "id": 12438492184,
        "content": "内容",
        "user": {
            ...
        },
        "status": {
            ....
        },
        "reply_comment": {
            ...
        }
    }

## 删除一条评论(实现)
url: comments/:id.json  
verb: DELETE  
arguments:

    :id  需要删除的评论ID  


# User
## 根据用户ID获取用户信息(实现)  
url: users/:id.json  
verb: GET  
arguments: 

    :id   需要查看的用户id

result:

    {
        "id": 1404376560,
        "name": "zaku",
        "description": "人生五十年，乃如梦如幻；有生斯有死，壮士复何憾。",
        "url": "http://blog.sina.com.cn/zaku",
        "gender": "m",
        "followers_count": 1204,
        "followeing_count": 79,
        "statuses_count": 2908,
        "favourites_count": 0,
        "created_at": "Fri Aug 28 00:00:00 +0800 2009",
        "following": false,
        "follow_me": false,
    }

# Relationships  
## 获取关注的用户列表(实现)  
url: users/:id/following.json  
verb: GET  
arguments:

    :id  当前登陆用户id  

result:  

    [
        {
            "id": 1404376560,
            "name": "zaku",
            "description": "人生五十年，乃如梦如幻；有生斯有死，壮士复何憾。",
                "url": "http://blog.sina.com.cn/zaku",
            "gender": "m",
            "followers_count": 1204,
            "followeing_count": 79,
            "statuses_count": 2908,
            "favourites_count": 0,
            "created_at": "Fri Aug 28 00:00:00 +0800 2009",
            "following": false,
            "follow_me": false,
        },
        ...
    ] 

## 获取用户的粉丝列表(实现)
url: users/:id/followers.json  
verb: GET  
arguments:  

    :id  当前登陆用户id  

result: 同获取关注的用户列表   

## 关注一个用户(实现)
url: relationships.json  
verb: POST  
arguments:

    {
        "relationship" : {
            "followed_id": 1
        }
    }

result: 同users/:id.json  

## 取消关注一个用户(实现)
url: relationships/:id.json  
verb: DELETE  
arguments:

    :id  对方的用户id

# Interests
## 获取用户的关注话题列表
url: intersts/index.json  
verb: GET  
arguments:
> uid: int: 需要查看的用户的ID  

result:

    {
        "intersts": [
            {
                "created_at": "Wed Jun 01 00:50:25 +0800 2011",
                "id": 12438492184,
                "topic": "iOS",
                "statuses_number": 1092,
            },
            ...
        ],
        "total_number": 60
    }

## 关注一个话题  
url: intersts/create.json  
verb: POST  
arguments:
> tid: int: 需要关注的的话题的ID  

result:

    {
        "created_at": "Wed Jun 01 00:50:25 +0800 2011",
        "id": 12438492184,
        "topic": "Android",
        "statuses_number": 1092,
    }

## 取消关注一个话题
url: intersts/destroy.json  
verb: POST  
arguments:
> tid: int: 需要取消关注的的话题的ID  

result: 同intersts/create.json 

# Account
## 登陆(实现)
url: login.json  
verb: POST  
arguments:

    {
        "session": {
            "email": "...",
            "password": "****"
        }
    } 

result: 同users/:id.json

## 注销(实现)
url: logout.json
verb: DELETE   

## 注册新用户(实现)
url: users.json  
verb: POST  
arguments:   

    {
        "user": {
            "name": "...",
            "email": "....",
            ..., // 用户的所有属性，性别只能为“m”或“f”
            "password": "******", //最少6位
            "password_confirmation": "******"
        }
    }

result 同users/:id.json

## 修改用户信息(实现)
url: users.json  
verb: POST  
arguments:  

    {
        "user": {
            "name": "...",
            "email": "....",
            ..., // 用户的所有属性，性别只能为“m”或“f”
            "password": "******", //最少6位
            "password_confirmation": "******"
        }
    }

# Favourites
## 获取当前登录用户的收藏列表(实现)
url: users/:id/favourites.json  
verb: GET  
arguments:  

    :id 当前登陆的用户的id

result: 同statuses/friends_timeline.json   

## 收藏/赞一篇文章(实现)
url: statuses/:id/good.json  
verb: GET  
arguments:

    :id 要收藏的文章的id    

result: 同statuses/:id.json  

## 批评一篇文章(实现)
url: statuses/:id/bad.json  
verb: GET  
arguments:

    :id 要批评的文章的id    

result: 同statuses/:id.json  

# Search
## 按名字搜索用户(实现)
url: search/user_search.json  
verb: POST  
arguments:  

    {
        "search":{
            "name":"mann"
        }
    }

result:  

    [
        {
            "id": 13,
            "name": "Mafalda Weimann",
            "description": "I am a Faker!",
            "url": "Mafalda_Weimann.fiigii.com",
            "gender": "m",
            "followers_count": 1,
            "followeing_count": 1,
            "statuses_count": 25,
            "favourites_count": 101,
            "created_at": "2013-05-13T15: 43: 43Z",
            "following": true,
            "follow_me": true
        },
        {
            "id": 31,
            "name": "Estell Gutmann",
            "description": "I am a Faker!",
            "url": "Estell_Gutmann.fiigii.com",
            "gender": "m",
            "followers_count": 1,
            "followeing_count": 1,
            "statuses_count": 25,
            "favourites_count": 101,
            "created_at": "2013-05-13T15: 43: 45Z",
            "following": true,
            "follow_me": true
        },
        {
            "id": 60,
            "name": "Madge Mann V",
            "description": "I am a Faker!",
            "url": "Madge_Mann_V.fiigii.com",
            "gender": "m",
            "followers_count": 1,
            "followeing_count": 1,
            "statuses_count": 25,
            "favourites_count": 0,
            "created_at": "2013-05-13T15: 43: 47Z",
            "following": true,
            "follow_me": true
        }
    ]
# Remind  
## 获取当前用户的各种消息未读数
url: remind/unread_count.json  
verb: GET  
arguments:
result:

    {
        "status": 0,  //新文章未读数
        "follower": 1,  //新粉丝数
        "cmt": 0,  //新评论数
    }

## 对当前登录用户某一种消息未读数进行清零
url: remind/set_count.json  
verb: POST  
arguments:
> type: string:  "status"或 "follower"或 "cmt"  





