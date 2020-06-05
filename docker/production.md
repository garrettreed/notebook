# Using Docker in Production

Begin by knowing you'll need to tweak default docker settings depending on the host system. Not a good idea to choose docker to avoid any administration tasks, because you will need to keep the engine and kernel updated, along with tweaking the settings. There are tools for managing containers, though there are tools to help you handle this like ECS or Kubernetes.

You have to consider the dev->testing->production pipeline.

Be sure to consider the challenging questions:

-   How will you monitor Docker containers in production?
-   How will things be deployed?
-   How will backups be performed?
-   What about updates? How will they be handled?

Attack vectors:

-   What services will your Docker containers get access to?
-   Are you able to restrict their access to the host system?
-   And what kind of “privileges” will they get?
