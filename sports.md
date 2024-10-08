---
layout: default
title: Sports
description: All the latest news and articles related to sports.
---

<h1>Sports</h1>
<p>Stay updated with the latest sports news and articles.</p>

<div id="sports-posts">
    <ul id="post-list">
        {% assign sports_posts = site.posts | where: "categories", "Sports" | sort: "date" | reverse %}
        {% for post in sports_posts limit: 10 %}
            <li>
                <a href="{{ post.url }}">{{ post.title }}</a> - {{ post.date | date: "%B %d, %Y" }}
            </li>
        {% endfor %}
    </ul>
</div>

{% if sports_posts.size > 10 %}
    <button id="load-more" class="button">Load More</button>
{% endif %}

<script>
    let currentIndex = 10;
    const posts = {% raw %}{{ sports_posts | jsonify }}{% endraw %};
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
