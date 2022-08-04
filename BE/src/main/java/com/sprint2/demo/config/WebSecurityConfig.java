package com.sprint2.demo.config;


import com.sprint2.demo.services.user.impl.UsersDetailsService;
import com.sprint2.demo.utils.AuthEntryPointJwt;
import com.sprint2.demo.utils.AuthTokenFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.InMemoryTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UsersDetailsService usersDetailService;

    @Autowired
    private AuthEntryPointJwt unauthorizedHandler;

    @Autowired
    public AuthTokenFilter authTokenFilter;

    /**
     * Created by HuuNQ
     * Time 16:00 29/06/2022
     * Function : this method use to encode password
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(usersDetailService).passwordEncoder(passwordEncoder());
    }

    /**
     * Created by HuuNQ
     * Time 16:00 29/06/2022
     * Function Create Bean AuthenticationManager
     */
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    /**
     * Created by HuuNQ
     * Time 16:00 29/06/2022
     * Override method configure to config
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {

        /**
         * @Author HuuNQ
         * @Time 17:00:00 04/07/2022
         * @Function Config role to access api url
         */
        http
                .csrf()
                .disable()
                .authorizeRequests()
                .antMatchers(
                        "/**"
                )
                .permitAll();
//                .antMatchers("/api/manager-customer/customers**", "/api/manager-prescription/**",
//                        "/api/manager-sale/**", "api/manager-sale/invoices**"
//                        , "/api/manager-prescription**", "/api/manager_report/**",
//                        "/api/payment**"
//                )
//                .hasAnyRole("EMPLOYEE", "MANAGER")
//                .antMatchers("/api/manager-account/**", "/api/manager-employee/**")
//                .hasRole("MANAGER")
//                .anyRequest()
//                .authenticated()
//                .and()
//                .sessionManagement()
//                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
//                .and()
//                .exceptionHandling()
//                .authenticationEntryPoint(unauthorizedHandler)
//                .and()
//                .rememberMe()
//                .tokenRepository(persistentTokenRepository())
//                .tokenValiditySeconds(computeDurationInMilliseconds()).and().logout().logoutSuccessUrl("/");
//
//        http.addFilterBefore(authTokenFilter, UsernamePasswordAuthenticationFilter.class);

    }

    public int computeDurationInMilliseconds() {
        return (60 * 60 * 60);
    }

    private PersistentTokenRepository persistentTokenRepository() {
        return new InMemoryTokenRepositoryImpl();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}