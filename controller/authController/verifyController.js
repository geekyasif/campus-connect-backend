import jwt from "jsonwebtoken";
import User from "../../model/UserSchema.js";


const verifyController = async (req, res) => {
    const { token } = req.query;
    try {

        const decode = jwt.verify(token, process.env.SECRET_KEY);
        const { email } = decode;

        const user = await User.findOne({ email, verificationToken: token });
        if (!user) {
            return res.status(400).josn({ message: "Invalid Token" });
        }

        user.status = true;
        user.verificationToken = undefined;
        await user.save();

        return res.status(200).json({ message: "success" });


    } catch (err) {
        console.log(err)
        return res.status(500).josn({ message: "Internal server error" })
    }
}

export default verifyController;