# Activepieces CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/activepieces"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Activepieces with CI/CD on Elestio

<img src="activepieces.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Activepieces UI here:

    URL: https://[CI_CD_DOMAIN]
    email: [ADMIN_EMAIL]
    password: [ADMIN_PASSWORD]

You can open pgAdmin web UI here:

    URL: https://[CI_CD_DOMAIN]:4792
    email: [ADMIN_EMAIL]
    password: [ADMIN_PASSWORD]

# Important

To access to your database with pgAdmin, the database password will be in your environment variable `AP_POSTGRES_PASSWORD`
