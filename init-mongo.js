// init-mongo.js

const user = process.env.MONGO_APP_USER || "appuser";
const pwd = process.env.MONGO_APP_PASSWORD || "apppass";
const dbName = process.env.MONGO_DATABASE || "piano_db";

db = db.getSiblingDB(dbName);

db.createUser({
  user: user,
  pwd: pwd,
  roles: [{ role: "readWrite", db: dbName }]
});

print(
  `Created application user '${user}' with readWrite on '${dbName}'`
);
