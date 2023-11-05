package ru.mephi.ourbookstore.controller.image;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import ru.mephi.ourbookstore.service.image.ImageService;

/**
 * @author Aleksei Iagnenkov (alekseiiagn)
 */
@RestController
@RequestMapping("/images")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@SecurityRequirement(name = "bearerAuth")
public class ImageController {

    final ImageService imageService;

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping(value = "/{imageId}", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public @ResponseBody Resource get(@PathVariable String imageId) {
        return imageService.get(imageId);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping
    public String save(@RequestParam("image") MultipartFile image) {
        return imageService.save(image);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PutMapping
    public void update(@RequestParam("imageId") String imageId,
                       @RequestParam("image") MultipartFile image
    ) {
        imageService.update(imageId, image);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @DeleteMapping("/{imageId}")
    public void remove(@PathVariable String imageId) {
        imageService.remove(imageId);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/{imageId}/books/{bookId}")
    public void addImageToBook(@PathVariable String imageId, @PathVariable Long bookId) {
        imageService.addImageToBook(imageId, bookId);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @DeleteMapping("/{imageId}/books/{bookId}")
    public void removeImageFromBook(@PathVariable String imageId, @PathVariable Long bookId) {
        imageService.removeImageFromBook(imageId, bookId);
    }
}
