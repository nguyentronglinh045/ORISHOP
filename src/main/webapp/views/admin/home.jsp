<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <head>
            <title>Dashboard - ORISHOP Admin</title>
        </head>

        <%-- Import all modular styles --%>
            <jsp:include page="sections/admin-home-styles.jsp" />

            <div class="container-fluid">
                <%-- Hero Section --%>
                    <div class="mb-4">
                        <jsp:include page="sections/hero-section.jsp" />
                    </div>

                    <%-- Stats Cards Section --%>
                        <div class="mb-4">
                            <jsp:include page="sections/stats-section.jsp" />
                        </div>

                        <%-- Charts Section - Full Width --%>
                            <div class="mb-4">
                                <jsp:include page="sections/charts-section.jsp" />
                            </div>

                            <%-- Daily Stats Section - Full Width --%>
                                <div class="mb-4">
                                    <jsp:include page="sections/daily-stats-section.jsp" />
                                </div>

                                <%-- Recent Orders Section - Full Width --%>
                                    <div class="row g-4 mb-4">
                                        <div class="col-12">
                                            <jsp:include page="sections/recent-orders-section.jsp" />
                                        </div>
                                    </div>

                                    <%-- Top Products & Performance Section --%>
                                        <div class="row g-4 mb-4">
                                            <div class="col-lg-6">
                                                <jsp:include page="sections/top-products-section.jsp" />
                                            </div>
                                            <div class="col-lg-6">
                                                <jsp:include page="sections/performance-section.jsp" />
                                            </div>
                                        </div>

                                        <%-- Quick Actions Section --%>
                                            <div class="row g-4 mb-4">
                                                <div class="col-12">
                                                    <jsp:include page="sections/quick-actions-section.jsp" />
                                                </div>
                                            </div>
            </div>