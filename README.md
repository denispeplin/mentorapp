# Mentorapp.Umbrella

## Installation Guide
1. Enter into our mentorapp_web
`cd ./apps/mentorapp_web`

2. Get our deps
`mix deps.get`
`npm install --prefix assets`

3. Create DB and setup migration
`mix ecto.create && mix ecto.migrate`

4. Create a `.env` file in the root fold `apps/mentorapp_web/.env`


5. Create an github app and retreive your client_id and client_secret
  a. Visit `https://github.com/settings/developers`
  b. Click on `new OAuth app` and enter the following information
    * `Application name: Mentorapp - Local`
    * `Homepage URL - http://localhost:4000`
    * `Authorization callback URL - http://localhost:4000/auth/github/callback`
  c. Once created, grab your `Client ID` and `Client Secret`

6. Add 4c information into to the `.env` like so
```
export GITHUB_CLIENT_ID="somethingclientid" 
export GITHUB_CLIENT_SECRET="1231312331231231212312" 
```

7. Generate a secret base and add it to `.env`
```
mix phx.gen.secret
LAgNrezvWW2R3Ak9wBOqk1Fgimmvfgt2BjYUZyjeYxwYoIVzy+MtacdnMfR200UK
```

`apps/mentorapp_web/.env`
```
export GITHUB_CLIENT_ID="somethingclientid" 
export GITHUB_CLIENT_SECRET="1231312331231231212312" 
export SECRET_KEY_BASE="LAgNrezvWW2R3Ak9wBOqk1Fgimmvfgt2BjYUZyjeYxwYoIVzy+MtacdnMfR200UK" 
```
8. Once that's done ran the following command whenver `.env` changes or reboot. Big thanks to [DarckBlezzer](https://stackoverflow.com/questions/44949561/set-load-environment-variables-in-a-phoenix-app)

`source .env && iex -S mix phx.server`



