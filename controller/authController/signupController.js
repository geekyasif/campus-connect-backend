import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import signupSchema from "../../validator/signupSchema.js";
import conn from "../../database/dbConfig.js";

const signupController = async (req, res) => {
  try {
    const { first_name, last_name, email, password } = req.body;

    // Schema validation
    const { error } = signupSchema.validate(req.body);

    if (error) {
      return res
        .status(400)
        .json({ error: "Bad Request!", message: error.message });
    }

    // checking user is already registered or not
    conn.query(
      `SELECT * FROM Users where email = '${email}'`,
      async (error, results) => {
        if (error) {
          return res
            .status(400)
            .json({ error: "Bad Request!", message: "Internal server error!" });
        } else if (results.length !== 0) {
          return res.status(400).json({
            error: "Bad Request!",
            message: "User is already registered!",
          });
        } else {
          // hasing the plain password
          const hashed_password = await bcrypt.hash(password, 10);

          // generating auth token
          const auth_token = jwt.sign({ email }, process.env.SECRET_KEY);

          // generating username
          const username = email.split("@")[0];

          // saving into database
          conn.query(
            `INSERT INTO Users(first_name, last_name, username, email, password) VALUES ( '${first_name}', '${last_name}', '${username}', '${email}', '${hashed_password}')`,
            (error, results) => {
              if (error) {
                console.log(error);
                return res.status(500).json({
                  error: "Internal server error",
                  message: "Registration unsuccessfull!",
                });
              }
            }
          );

          // retriving user data from the database
          conn.query(
            `SELECT id, first_name, last_name, username, email FROM Users where email = '${email}'`,
            (error, results) => {
              if (error) {
                return res.status(500).json({
                  error: "Internal server error",
                  message: "User not found!",
                });
              }

              return res.status(200).json({
                auth_token,
                data: results[0],
              });
            }
          );
        }
      }
    );
  } catch (error) {
    return res.status(500).json({
      error: "Internal server error",
      message: "Something went wrong!",
    });
  }
};

export default signupController;
