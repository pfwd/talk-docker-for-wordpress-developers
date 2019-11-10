---
theme: uncover
class:
  - lead
  - invert
size: 16:9
footer: "Peter Fisher BSc MBCS howtocodewell.net @pfwd @howToCodeWell"
---

# Docker For WordPress Sites


---

# How many of you have heard of Docker?

--- 

# How many of you use Docker with WordPress?

---

# What | Why/When | How

---
# What is Docker?

---

![alt text](../src/assets/images/docker_was_born.jpg)

---
# Docker is a containerization technology

---
- A system is split into multiple containers
- Each container has a single responsibility
- Each container can be duplicated
---
# Docker has 3 parts

1) The client
2) The API
3) The Engine

---
# Docker Client

- Command line
- Desktop GUI
- Web based / other
---
# Docker API

Communication layer

---
# Docker Engine

The backend of Docker which handles all the Docker objects (Networks/containers/Images/Volumes/etc)

---
### A Docker container is built from a Docker image

![bg right:50% width:80%](../src/assets/images/contains_eggs.jpg)

---
### A Docker image is made from many cached intermediate images

![bg right:50% width:80%](../src/assets/images/caching.jpg)

---
### A Dockerfile is a set of build instructions

![bg right:60% width:75%](../src/assets/images/instructions.jpg)

---
## Baking Docker containers is like baking cookies

![bg right:50% width:75%](../src/assets/images/baking.jpg)

---
# A Docker Image is the baked ingredients
![bg right:50% width:75%](../src/assets/images/cookies.jpg)

---
# A Dockerfile is the recipe
![bg right:50% width:75%](../src/assets/images/recipe.jpg)

---

# What is the difference between VM's and Containers

---
![bg width:55%](../src/assets/images/containers_virtual_machines.jpg)

---
# Containerization != Virtualization

---
## Virtualization is like a house
![bg width:80% right:50%](../src/assets/images/simple_house_floor_plan.gif)

---
## Containerization is like a room
![bg width:80% right:50%](../src/assets/images/room.jpg)

---
# Different levels of abstraction

---
# Virtualization
- Custom Environment
- Allocated Resources
- Ecosystem

---
# Containerization
- Single process
- Single responsibilty
- Single purpose

---
# Docker can be used continuous integration