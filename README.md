# TankMates
Scotty based backend for the tank-m8s app

```bash
$ curl -d '{"tankRequestTankId": "1738", "tankRequestMateName": "Chowder", "tankRequestSpecies": "Fish", "tankRequestReminder": false}' -H 'Content-Type: application/json' localhost:3000/api/tank
$ curl localhost:3000/api/tank/<tank_id>
```
