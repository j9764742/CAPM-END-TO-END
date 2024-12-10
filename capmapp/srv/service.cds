using { capmapp.db.master as master,
capmapp.db.trans as transaction } from '../db/demo';

service MyService {

    entity Books as projection on master.books;
    entity standards as projection on master.standards;
    entity StudentRentals as projection on transaction.rentals;
    entity Students as projection on master.students;

}
