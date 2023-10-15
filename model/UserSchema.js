import mongoose from "mongoose";


const {Schema} = mongoose;

const UserSchema = new Schema({
    name: {
        type: String,
        require: true,
    },
    email: {
        type: String,
        require: true
    },
    phone: {
        type: Number,
        require: false
    },
    password: {
        type: String,
        require: true
    },
    idAdmin: {
        type: Boolean,
        default: false
    },
    status:{
        type: Boolean,
        default: false
    },
    verificationToken: {
        type: String,
        require: true
    },
    education:{
        branch:{
            type: String,
            require: false,
        },
        department: {
            type: String,
            require: false,
        },
        year:{
            type: Number,
            require: false,
        },
        section:{
            type: String,
            require: false,
        }
    },
    skills: {
        type: [String],
        require: false
    },
    social_links:[{
        type: String,
        require: false,
    }],
    projects:[{
        title: {
            type: String,
            require: false
        },
        description: {
            type: String,
            require: false,
        },
        source_code: {
            type: String,
            requre: false,
        },
        demo: {
            type: String,
            require: false,
        }
    }]


},{ timestamps: true });



export default mongoose.model("User", UserSchema);



