import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';

import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {HeaderComponent} from './component/header/header.component';
import {FooterComponent} from './component/footer/footer.component';
import {HomePageComponent} from './component/home-page/home-page.component';
import {LoginComponent} from './component/login/login.component';
import {BookDetailComponent} from './component/book-detail/book-detail.component';
import {CartComponent} from './component/cart/cart.component';
import {CarouselModule} from 'ngx-owl-carousel-o';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {HttpClientModule} from '@angular/common/http';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {ToastrModule} from 'ngx-toastr';
import {NgxPayPalModule} from 'ngx-paypal';
import {CheckOutComponent} from './component/check-out/check-out.component';
import {NgxSpinnerModule} from 'ngx-spinner';
import { AccessDeninedComponent } from './component/access-denined/access-denined.component';
import { NotFoundComponent } from './component/not-found/not-found.component';
import { PurchaseHistoryComponent } from './component/purchase-history/purchase-history.component';
import { UserDetailComponent } from './component/user-detail/user-detail.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    HomePageComponent,
    LoginComponent,
    BookDetailComponent,
    CartComponent,
    CheckOutComponent,
    AccessDeninedComponent,
    NotFoundComponent,
    PurchaseHistoryComponent,
    UserDetailComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    CarouselModule,
    BrowserAnimationsModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule,
    NgxPayPalModule,
    NgxSpinnerModule,
    ToastrModule.forRoot(),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
}
