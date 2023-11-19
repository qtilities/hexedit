#include "hexeditplugin.hpp"

#include <hexedit/hexedit.hpp>

#include <QtPlugin>

HexEditPlugin::HexEditPlugin(QObject* parent)
    : QObject(parent)
{
}

void HexEditPlugin::initialize(QDesignerFormEditorInterface * /*core*/)
{
    if (initialized)
        return;

    initialized = true;
}

bool HexEditPlugin::isInitialized() const
{
    return initialized;
}

QWidget* HexEditPlugin::createWidget(QWidget* parent)
{
    return new HexEdit(parent);
}

QString HexEditPlugin::name() const
{
    return QStringLiteral("HexEdit");
}

QString HexEditPlugin::group() const
{
    return QStringLiteral("Qtilities");
}

QIcon HexEditPlugin::icon() const
{
    return QIcon(":/icon");
}

QString HexEditPlugin::toolTip() const
{
    return QString();
}

QString HexEditPlugin::whatsThis() const
{
    return QString();
}

bool HexEditPlugin::isContainer() const
{
    return false;
}

QString HexEditPlugin::domXml() const
{
    return "<ui language=\"c++\">\n"
        " <widget class=\"HexEdit\" name=\"hexEdit\">\n"
        "  <property name=\"geometry\">\n"
        "   <rect>\n"
        "    <x>0</x>\n"
        "    <y>0</y>\n"
        "    <width>100</width>\n"
        "    <height>100</height>\n"
        "   </rect>\n"
        "  </property>\n"
        " </widget>\n"
        "</ui>\n";
}

QString HexEditPlugin::includeFile() const
{
    return QStringLiteral("hexedit.hpp");
}
