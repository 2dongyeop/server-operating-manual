package io.dongvelop.gateway.filter;

import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * @author 이동엽(Lee Dongyeop)
 * @date 2025. 04. 26
 * @description 인증/인가 필터
 */
@Component
public class AuthorizationFilter extends AbstractGatewayFilterFactory<AuthorizationFilter.Config> {


    public AuthorizationFilter() {
        super(Config.class);
    }

    @Override
    public GatewayFilter apply(Config config) {
        return (exchange, chain) -> {

            final ServerHttpRequest request = exchange.getRequest();
            final HttpHeaders headers = request.getHeaders();

            // TODO 인가 헤더 여부 검사.
            if (!headers.containsKey(HttpHeaders.AUTHORIZATION)) {
                return onError(exchange, HttpStatus.UNAUTHORIZED);
            }

            // TODO 인가 헤더 값 검사.
//            final String headerAuth = request.getHeaders().get(HttpHeaders.AUTHORIZATION).get(0);
//            if (!StringUtils.hasText(headerAuth) || !headerAuth.startsWith("Bearer ")) {
//                return onError(exchange, HttpStatus.UNAUTHORIZED);
//            }

            try {
                // TODO 헤더의 JWT 파싱 및 필요 정보 추출
                // TODO 인가 성공에 대한 헤더 추가 삽입 => API Server 에서 검증
                request.mutate().headers(h -> {
                    h.set("X-Header-Example1", "hello1");
                    h.set("X-Header-Example2", "hello2");
                });

            } catch (Exception e) {
                return onError(exchange, HttpStatus.UNAUTHORIZED);
            }

            return chain.filter(exchange);
        };
    }

    private Mono<Void> onError(ServerWebExchange exchange, HttpStatus httpStatus) {
        ServerHttpResponse response = exchange.getResponse();
        response.setStatusCode(httpStatus);
        return response.setComplete();
    }

    public static class Config {
        // application.yml 파일에서 지정한 filer의 Argument값을 전달받는 곳.
    }
}

