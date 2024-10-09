---
title: News
layout: default
---

## Latest News

Here you can find the latest news articles categorized specifically for your convenience. Our news section provides timely updates and insights.

<div id="news-container">
    {% assign news_posts = site.posts | where: "category", "news" | sort: "date" | reverse %}
    {% for post in news_posts limit: 10 %}
        <div class="news-item">
            <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
            <p><strong>Published on:</strong> {{ post.date | date: "%B %d, %Y" }}</p>
            <p><strong>Summary:</strong> {{ post.excerpt }}</p>
        </div>
    {% endfor %}
</div>

<button id="load-more" onclick="loadMoreNews()">Load More News</button>

<script>
    let newsIndex = 10; // Start index for loading more news
    const newsPosts = {{ news_posts | jsonify }}; // Convert Jekyll variable to JavaScript array

    function loadMoreNews() {
        const container = document.getElementById('news-container');
        const loadMoreButton = document.getElementById('load-more');

        for (let i = newsIndex; i < newsIndex + 5 && i < newsPosts.length; i++) {
            const post = newsPosts[i];
            const newsItem = document.createElement('div');
            newsItem.className = 'news-item';
            newsItem.innerHTML = `
                <h3><a href="${post.url}">${post.title}</a></h3>
                <p><strong>Published on:</strong> ${new Date(post.date).toLocaleDateString()}</p>
                <p><strong>Summary:</strong> ${post.excerpt}</p>
            `;
            container.appendChild(newsItem);
        }

        newsIndex += 5; // Update the index for the next load

        // Hide the button if all news articles are loaded
        if (newsIndex >= newsPosts.length) {
            loadMoreButton.style.display = 'none';
        }
    }
</script>

---

For more detailed information, check back regularly as we update our news section with the latest insights and updates.
