import {NgModule} from '@angular/core';
import {RouterModule, Routes} from '@angular/router';
import {HomePageComponent} from './component/home-page/home-page.component';
import {BookDetailComponent} from './component/book-detail/book-detail.component';
import {LoginComponent} from './component/login/login.component';
import {CartComponent} from './component/cart/cart.component';
import {CheckOutComponent} from './component/check-out/check-out.component';
import {AccessDeninedComponent} from './component/access-denined/access-denined.component';
import {NotFoundComponent} from './component/not-found/not-found.component';
import {AuthGuard} from './service/security/auth.guard';
import {PurchaseHistoryComponent} from './component/purchase-history/purchase-history.component';
import {UserDetailComponent} from './component/user-detail/user-detail.component';


const routes: Routes = [
  {path: '', pathMatch: 'full', redirectTo: 'home-page'},
  {path: 'home-page', component: HomePageComponent},
  {path: 'book-detail/:id', component: BookDetailComponent},
  {path: 'login', component: LoginComponent},
  {path: 'cart', component: CartComponent},
  {
    path: 'check-out', component: CheckOutComponent,
    canActivate: [AuthGuard], data: {
      roles: ['ROLE_MANAGER', 'ROLE_EMPLOYEE', 'ROLE_USER']
    }
  },
  {path: 'access-denied', component: AccessDeninedComponent},
  {path: 'not-found', component: NotFoundComponent},
  {path: 'user-history', component: PurchaseHistoryComponent},
  {path: 'user-detail', component: UserDetailComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {
    scrollPositionRestoration: 'enabled'
  })],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
