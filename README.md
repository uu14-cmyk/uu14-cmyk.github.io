# Personal Portfolio (Quarto)

## Preview
```
quarto preview
```
Render once with `quarto render` (output goes to `docs/`).

## Add a project
Copy `projects/sample-project/` to `projects/my-new-project/`, then edit its `index.qmd` (title, description, date, categories, image). It appears automatically on the Portfolio page.

## Blog
Add posts under `posts/<name>/index.qmd`. To show the Blog in the navbar, uncomment its entry in `_quarto.yml`. Remove `draft: true` to publish a post.

## Publish to GitHub Pages
1. Run `quarto render` and commit the `docs/` folder.
2. Create a repo (e.g. `uu14-cmyk.github.io`, or any name) and push to `main`.
3. Settings -> Pages -> Deploy from branch -> `main` -> `/docs`.

Alternative: `quarto publish gh-pages` (builds and pushes to a `gh-pages` branch for you).

## Custom domain (optional)
Add a `CNAME` file containing your domain to the project root, list it under `resources:` in `_quarto.yml` so it lands in `docs/`, then set the domain in Settings -> Pages and configure DNS.

## To fill in
Name, bio, headshot (`images/headshot.svg`, or swap in a JPG and update `index.qmd`), LinkedIn URL, email, `files/resume.pdf`, and project content.

## Publishing updates (easy way)
1. Save your changes to the site files.
2. Double-click `publish.bat`.
3. Type a short description of what you changed (or just press Enter), then wait for "Published!". Your site updates at https://uu14-cmyk.github.io in 1-2 minutes.

Prefer the manual way? Run `quarto render`, then `git add -A`, `git commit -m "your message"` and `git push`.
