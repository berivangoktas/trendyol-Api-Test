package features.booksApi;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;

class bookTestRunner {

    @Karate.Test
    @Tag("test")
    @Order(value = 1)
    Karate createBook() {
        return Karate.run("create_book").relativeTo(getClass());
    }

    @Karate.Test
    @Tag("test")
    @Order(value = 1)
    Karate getOrder() {
        return Karate.run("get_books").relativeTo(getClass());
    }

}
