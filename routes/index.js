import express from "express";
import signinController from "../controller/authController/signinController.js";
import signupController from "../controller/authController/signupController.js";
import verifyController from "../controller/authController/verifyController.js";

const router = express.Router();



// register route
router.post("/signup", signupController);

// email verification route
router.get('verify', verifyController);

// sigin route
router.post("signin", signinController);

export default router;