---
layout: default
title: Entertainment
description: All the latest news and articles related to entertainment.
---

<h1>Entertainment</h1>
<p>Catch up on the latest news, reviews, and trends in entertainment.</p>

<div id="entertainment-posts">
    <ul id="post-list">
        {% assign entertainment_posts = site.posts | where: "categories", "Entertainment" | sort: "date" | reverse %}
        {% for post in entertainment_posts limit: 10 %}
            <li>
                <a href="{{ post.url }}">{{ post.title }}</a> - {{ post.date | date: "%B %d, %Y" }}
            </li>
        {% endfor %}
    </ul>
</div>

{% if entertainment_posts.size > 10 %}
    <button id="load-more" class="button">Load More</button>
{% endif %}

<script>
    let currentIndex = 10;
    const posts = {% raw %}{{ entertainment_posts | jsonify }}{% endraw %};
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
