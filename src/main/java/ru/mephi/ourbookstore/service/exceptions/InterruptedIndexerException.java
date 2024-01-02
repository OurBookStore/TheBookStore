package ru.mephi.ourbookstore.service.exceptions;

public class InterruptedIndexerException extends BookStoreException{
    public InterruptedIndexerException() {
        super(BookStoreError.INDEXER_THREAD_INTERRUPTED, null, null, null);
    }
}
