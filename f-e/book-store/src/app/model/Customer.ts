import {Users} from './Users';

export interface Customer {
  id: number;
  name: string;
  birthday: string;
  gender: number;
  address: string;
  phone: string;
  email: string;
  status: boolean;
  username: Users;
}
