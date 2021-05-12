<p align="center">
  <a href="https://www.brighthr.com">
    <img alt="Bright favicon" src="./images/favicon.png" width="60" />
  </a>
</p>
<h1 align="center">
    Running the project on your Machine 👨‍💻
</h1>

This is a static site that displays the progression frameworks that Bright use internally for our staff 🙌

It's built in Gatsby, and deployed using Netlify.
## ✏ Editing the framework
The `frameworks` folder contains markdown files for each role family. The files are a mix of markdown and YAML. The sectiom between both instances of `---` are formated as YAML. e.g. 

```
---
path: "/engineering/backend"
title: "🛠️ Backend Engineering Framework"
sidebarTitle: "🛠️ Backend"
sidebarGroup: "engineering"
yaml: true
levels: 4
homepage: true
topics:
  - name: "communication"
    title:
    content:
      - level: 1
        criteria:
          - "Provides regular updates to their mentor/buddy"
          - "Points out syntactical improvements in code reviews"
          - "Writes PR descriptions that provide basic context for the change"
          - "Seeks guidance from other engineers, rather than answers"
---

Some markdown
```

Spacing matters in YAML, so it may be helpful to have an editor that understands YAML such as Visual Studio code with the YAML plugin.

## 🚀 Quick start

You'll need the Gatsby CLI on your machine, so if you don't have it, install it!
``` sh
npm install --global gatsby-cli
```

Next, navigate to the `progression-framework` directory and use yarn to get everything installed

``` sh
cd progression-framework
npm install
```

If you're developing locally, you can start up the site locally with hot loading ⚡
``` sh
npm run start
npm run develop
```
That runs the following scripts: 🤓
```sh 
    "start": "npm run develop"
    "develop": "gatsby develop"
```

You can now view @brighthr/progression-framework in the browser.⠀
``` sh
  http://localhost:8000/
```
Finally, you can build everything into a set of static files 🛠️
``` sh
npm run build
```
Which runs (`gatsby build`)
Reason why I'm not using ` Yarn `to instal the node_modules is there is a strange issue when downloading and running the `Sharp` package using our network. 🤷🏽‍♂️ 