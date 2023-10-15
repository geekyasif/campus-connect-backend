import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import User from "../../model/UserSchema.js";
import signinSchema from "../../validator/signinSchema.js";


const signinController = async (req, res) => {

    const {email, password} = req.body;

    // validating req
    const {error, value} = signinSchema.validate(req.body);
    
    if(error){
        return res.status(400).json({message: error.details[0].message});
    }


    const user = await User.findOne({email});

    if(!user){
        return res.status(400).json({message: "User is not registered!"});
    }

    // comparing password
    const isValidPassword = await bcrypt.compare(password, user.password);

    if(!isValidPassword){
        return res.status(400).json({message: "Invalid credentials!"});
    }

    // email not verified!
    if(user.status == false){
        return res.status(400).json({message: "Your email is not verfied!"});
    }

    // generating password
    const token = jwt.sign({email}, process.env.SECRET_KEY);
    return res.status(200).json({token});

}

export default signinController;