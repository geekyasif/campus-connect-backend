import mongoose from "mongoose";

const Schema = mongoose.Schema;

const ProductSchema = new Schema({
    title: {
        type: String,
        require: false,
    },
    description: {
        type: String,
        require: false
    },
    source_code: {
        type: String,
        require: false,
    },
    demo: {
        type: String,
        require: false
    }
})

export default mongoose.model("Product", ProductSchema)