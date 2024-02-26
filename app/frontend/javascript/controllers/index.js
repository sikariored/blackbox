// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import Articles_controller from "~/javascript/controllers/articles_controller";
import Secure_records_controller from "~/javascript/controllers/secure_records_controller";
import History_controller from "@/javascript/controllers/history_controller";

application.register("secure_records", Secure_records_controller)
application.register("articles", Articles_controller)
application.register("history", History_controller)
