public class BookingFuture {

    @future
    public static void updateBooking(Id bookingId) {

        Booking__c b = [
            SELECT Id, Booking_Status__c
            FROM Booking__c
            WHERE Id = :bookingId
            LIMIT 1
        ];

        b.Booking_Status__c = 'Completed';

        update b;
    }
}