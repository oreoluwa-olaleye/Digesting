---
title: Reports
layout: default
---

## Latest Reports

Here you can find the latest reports categorized specifically for your convenience. Our reports provide in-depth analysis and insights to keep you informed.

<div id="reports-container">
    {% assign report_posts = site.posts | where: "categories", "reports" | sort: "date" | reverse %}
    {% for post in report_posts limit: 10 %}
        <div class="report-item">
            <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
            <p><strong>Published on:</strong> {{ post.date | date: "%B %d, %Y" }}</p>
            <p><strong>Summary:</strong> {{ post.excerpt }}</p>
        </div>
    {% endfor %}
</div>

<button id="load-more" onclick="loadMoreReports()">Load More Reports</button>

<script>
    let reportIndex = 10; // Start index for loading more reports
    const reportPosts = {{ report_posts | jsonify }}; // Convert Jekyll variable to JavaScript array

    function loadMoreReports() {
        const container = document.getElementById('reports-container');
        const loadMoreButton = document.getElementById('load-more');

        for (let i = reportIndex; i < reportIndex + 5 && i < reportPosts.length; i++) {
            const post = reportPosts[i];
            const reportItem = document.createElement('div');
            reportItem.className = 'report-item';
            reportItem.innerHTML = `
                <h3><a href="${post.url}">${post.title}</a></h3>
                <p><strong>Published on:</strong> ${post.date}</p>
                <p><strong>Summary:</strong> ${post.excerpt}</p>
            `;
            container.appendChild(reportItem);
        }

        reportIndex += 5; // Update the index for the next load

        // Hide the button if all reports are loaded
        if (reportIndex >= reportPosts.length) {
            loadMoreButton.style.display = 'none';
        }
    }
</script>

---

For more detailed information, check back regularly as we update our reports section with the latest insights and analyses.
