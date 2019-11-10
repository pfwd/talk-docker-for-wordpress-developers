# talk-template
A talk template that uses Marp CLI

## Install

1 Clone the repo 
```bash
$ git clone git@github.com:pfwd/talk-template.git
`````

2 Run install using Makefile

```bash
$ make install
`````
Update `src/slides.md` with content.  
Add images to `src/assets/images/`.

## Build slide deck

### Build HTML from slides

```bash
$ make build_html
```

### Watch HTML from slides

```bash
$ make watch_html
```

### Build PDF from slides

```bash
$ make build_pdf
```

### Build PPT from slides

```bash
$ make build_pp
```