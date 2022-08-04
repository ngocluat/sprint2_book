import {CartDto} from './CartDto';
import {Customer} from './Customer';

export interface CartAndDetailDto {
  id?: number;
  customer?: Customer;
  cartDtoList?: CartDto[];
  dateCreate?: string;
  total?: number;
}
