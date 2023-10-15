import Joi from "joi";

const signinSchema = Joi.object({
    
    email: Joi.string()
    .email({ minDomainSegments: 2, tlds: { allow: false } }).regex(/^[a-zA-Z0-9._%+-]+@galgotiasuniversity\.edu\.in$/).required(),

    password: Joi.string().pattern(new RegExp('^[a-zA-Z0-9]{3,30}$')).required(),
})

export default signinSchema;