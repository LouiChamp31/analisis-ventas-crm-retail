-- ¿Cuánto ingreso y ganancia generó cada categoría?
SELECT 
    categoria,
    SUM(cantidad * precio_unitario) AS ingreso_total,
    SUM(cantidad * (precio_unitario - costo_unitario)) AS ganancia_total,
    ROUND(SUM(cantidad * (precio_unitario - costo_unitario)) * 100.0 / 
          SUM(cantidad * precio_unitario), 1) AS margen_pct
FROM ventas
GROUP BY categoria
ORDER BY ingreso_total DESC;


-- ¿Qué vendedor genera más valor?
SELECT
    vendedor,
    COUNT(*) AS num_ventas,
    SUM(cantidad * precio_unitario) AS ingreso_total,
    ROUND(AVG(cantidad * precio_unitario), 0) AS ticket_promedio,
    ROUND(SUM(cantidad * (precio_unitario - costo_unitario)) * 100.0 /
          SUM(cantidad * precio_unitario), 1) AS margen_pct
FROM ventas
GROUP BY vendedor
ORDER BY ingreso_total DESC;


-- ¿Cómo evolucionaron las ventas mes a mes?
SELECT
    SUBSTR(fecha, 1, 7) AS mes,
    COUNT(*) AS num_ventas,
    SUM(cantidad * precio_unitario) AS ingreso_total,
    ROUND(AVG(cantidad * precio_unitario), 0) AS ticket_promedio
FROM ventas
GROUP BY mes
ORDER BY mes ASC;

-- ¿Qué segmento de cliente es más valioso?
SELECT
    cliente_segmento,
    COUNT(*) AS num_ventas,
    SUM(cantidad * precio_unitario) AS ingreso_total,
    ROUND(AVG(cantidad * precio_unitario), 0) AS ticket_promedio,
    ROUND(SUM(cantidad * (precio_unitario - costo_unitario)) * 100.0 /
          SUM(cantidad * precio_unitario), 1) AS margen_pct
FROM ventas
GROUP BY cliente_segmento
ORDER BY ingreso_total DESC;
