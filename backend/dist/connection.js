"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mysql_1 = __importDefault(require("mysql"));
const connect = () => __awaiter(this, void 0, void 0, function* () {
    let db = yield mysql_1.default.createConnection({
        host: '127.0.0.1',
        user: 'root',
        password: null,
        database: 'chinook'
    });
    console.log('CREATED CONNECTION');
    yield db.connect();
    console.log('Connected');
    db.query('SELECT * from Track', (err, rows) => {
        if (err)
            throw err;
        console.log(rows);
    });
});
exports.default = connect;
//# sourceMappingURL=connection.js.map