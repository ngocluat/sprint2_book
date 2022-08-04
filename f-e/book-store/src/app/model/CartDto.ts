import {BookDto} from './BookDto';

export interface CartDto {
  book: BookDto;
  quantity: number;
}
