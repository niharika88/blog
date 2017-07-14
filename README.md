== README

This application allows one to add comments on paragraphs of a blog post.

Language: Ruby

Pagination: Kaminari gem

Database: Sqlite

Postman Collection Link: https://www.getpostman.com/collections/03bb1c5ab0abceff8896

```

Steps for runing app:

Clone repo

cd blog

bundle install

rake db:migrate

rails s

server will run on localhost/3000


```

Api to get all blog posts 5 records per call.

HTTP GET 
============

http://localhost:3000/bloggers?page=1

params: page number

sample output:
==============

```

[
    {
        "id": 16,
        "tite": "new onw\\e",
        "author": "niharika",
        "paragraphs": [
            "dsfs",
            "fffeaf"
        ],
        "created_at": "2017-07-14T21:47:31.159Z"
    },
    {
        "id": 17,
        "tite": "new onw\\e",
        "author": "niharika",
        "paragraphs": [
            "dsfs",
            "fffeaf"
        ],
        "created_at": "2017-07-14T21:51:06.431Z"
    },
    {
        "id": 18,
        "tite": "new onw\\e",
        "author": "niharika",
        "paragraphs": [
            "dsfs",
            "fffeaf"
        ],
        "created_at": "2017-07-14T21:51:33.313Z"
    },
    {
        "id": 19,
        "tite": "new onw\\e",
        "author": "niharika",
        "paragraphs": [
            "dsfs",
            "fffeaf"
        ],
        "created_at": "2017-07-14T21:51:59.413Z"
    },
    {
        "id": 20,
        "tite": "new onw\\e",
        "author": "niharika",
        "paragraphs": [
            "dsfs",
            "fffeaf"
        ],
        "created_at": "2017-07-14T21:52:05.530Z"
    }
]



```


Api to list blog with all content including comments per aragraph

HTTP GET
==========

http://localhost:3000/bloggers/blog_id

params:  blog_id

sample output:
===============

```
{
    "id": 33,
    "title": "new onw\\e",
    "author": "niharika",
    "paragraph_details": [
        {
            "id": 37,
            "data": "dsfs",
            "comments": [
                "hello first comment",
                "hello first comment",
                "hello first comment",
                "hello first commentnvnv"
            ]
        },
        {
            "id": 38,
            "data": "fffeaf",
            "comments": [
                "newww"
            ]
        }
    ]
}
```

Api to create a blog

HTTP POST

http://localhost:3000/bloggers

params: 

blogger[title] : New Blog

blogger[author] : Niharika

blogger[paragraphs] : "hiioh\n\n hdkhkjf\n\n"


Sample Output
===============

```
{
    "id": 37,
    "title": "new onw\\e",
    "author": "niharika",
    "paragraphs": [
        "dsfs",
        "fffeaf",
        "fdgdd",
        "ghhh\n"
    ]
}

```

Api to create comments on a paragraph

HTTP POST

http://localhost:3000/comments

params:

comment[paragraph_id]: id
comment[body]: "dfffd new comment"

Sample Output
==============

```
{
    "id": 6,
    "body": "newww",
    "paragraph_details": {
        "id": 38,
        "data": "fffeaf",
        "blogger_id": 33,
        "created_at": "2017-07-14T22:05:57.467Z",
        "updated_at": "2017-07-14T22:05:57.475Z"
    }
}

```






Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
