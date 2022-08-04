import {Author} from './Author';
import {Category} from './Category';
import {Discount} from './Discount';

export interface BookDto {
  id?: number;
  name: string;
  code: string;
  translator: string;
  publisher: string;
  totalPage: number;
  dimension: string;
  releaseDate: string;
  quantity?: number;
  price: number;
  description: string;
  image: string;
  status?: boolean;
  author?: Author;
  category?: Category;
  discount?: Discount;
}
