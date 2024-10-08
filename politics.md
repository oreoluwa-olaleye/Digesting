---
layout: default
title: Politics
description: All the latest news and articles related to politics.
---

<h1>Politics</h1>
<p>Stay informed with the latest news and articles on politics.</p>

<div id="politics-posts">
    <ul id="post-list">
        {% assign politics_posts = site.posts | where: "categories", "Politics" | sort: "date" | reverse %}
        {% for post in politics_posts limit: 10 %}
            <li>
                <a href="{{ post.url }}">{{ post.title }}</a> - {{ post.date | date: "%B %d, %Y" }}
            </li>
        {% endfor %}
    </ul>
</div>

{% if politics_posts.size > 10 %}
    <button id="load-more" class="button">Load More</button>
{% endif %}

<script>
    let currentIndex = 10;
    const posts = {% raw %}{{ politics_posts | jsonify }}{% endraw %};
    const postList = document.getElementById('post-list');
    const loadMoreButton = document.getElementById('load-more');

    loadMoreButton.addEventListener('click', () => {
        const nextPosts = posts.slice(currentIndex, currentIndex + 10);
        if (nextPosts.length > 0) {
            nextPosts.forEach(post => {
                const listItem = document.createElement('li');
                listItem.innerHTML = `<a href="${post.url}">${post.title}</a> - ${new Date(post.date).toLocaleDateString()}`;
                postList.appendChild(listItem);
            });
            currentIndex += 10;
        }

        // Hide button if no more posts are left to load
        if (currentIndex >= posts.length) {
            loadMoreButton.style.display = 'none';
        }
    });
</script>
