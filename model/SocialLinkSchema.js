import mongoose from "mongoose";

const Schema = mongoose.Schema

const SocialLinkSchema = new Schema({
    link:{
        type: String,
        require: false
    }
})


export default mongoose.model("SocialLink", SocialLinkSchema);