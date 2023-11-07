package ru.mephi.ourbookstore.service.image;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import ru.mephi.ourbookstore.domain.Entities;
import ru.mephi.ourbookstore.service.book.BookService;
import ru.mephi.ourbookstore.service.exceptions.NotFoundException;
import ru.mephi.ourbookstore.service.exceptions.ReadException;
import ru.mephi.ourbookstore.service.exceptions.SaveException;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ImageService {

    final BookService bookService;

    private static final String FORMAT_IMAGE_PATH = "src/main/resources/image/%s.png";

    public Resource get(String imageId) {
        Path path = Paths.get(String.format(FORMAT_IMAGE_PATH, imageId));
        ByteArrayResource image;
        try {
            image = new ByteArrayResource(Files.readAllBytes(path));
        } catch (NoSuchFileException e) {
            throw new NotFoundException(Entities.IMAGE, "image name", imageId);
        } catch (IOException e) {
            throw new SaveException(Entities.IMAGE, "imageId", imageId);
        }
        return image;
    }

    public String save(MultipartFile image) {
        String imageId = generateImageId();
        File imageFile = getImageFile(imageId);
        try (OutputStream os = new FileOutputStream(imageFile)) {
            os.write(image.getBytes());
        } catch (IOException e) {
            throw new ReadException(Entities.IMAGE, "image name", imageId);
        }
        return imageId;
    }

    public void update(String imageId, MultipartFile image) {
        File imageFile = getImageFile(imageId);
        if (!imageFile.exists()) {
            throw new NotFoundException(Entities.IMAGE, "image name", imageId);
        }
        try (OutputStream os = new FileOutputStream(imageFile)) {
            os.write(image.getBytes());
        } catch (IOException e) {
            throw new ReadException(Entities.IMAGE, "image name", imageId);
        }
    }

    @Transactional
    public void remove(String imageId) {
        File imageFile = getImageFile(imageId);
        if (!imageFile.exists()) {
            throw new NotFoundException(Entities.IMAGE, "image name", imageId);
        }
        imageFile.delete();
        bookService.removeImage(imageId);
    }

    @Transactional
    public void addImageToBook(String imageId, Long bookId) {
        File imageFile = getImageFile(imageId);
        if (!imageFile.exists()) {
            throw new NotFoundException(Entities.IMAGE, "image name", imageId);
        }
        bookService.addImageToBook(imageId, bookId);
    }

    @Transactional
    public void removeImageFromBook(String imageId, Long bookId) {
        File imageFile = getImageFile(imageId);
        if (!imageFile.exists()) {
            throw new NotFoundException(Entities.IMAGE, "image name", imageId);
        }
        bookService.removeImageFromBook(bookId);
    }

    private File getImageFile(String imageId) {
        return new File(String.format(FORMAT_IMAGE_PATH, imageId));
    }

    private String generateImageId() {
        return "image-" + UUID.randomUUID();
    }
}
